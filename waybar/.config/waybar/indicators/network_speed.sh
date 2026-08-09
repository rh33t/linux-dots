#!/usr/bin/env python3
import json
import subprocess
import time
import os

STATE_FILE = "/tmp/waybar_netspeed_state.json"


def get_default_iface():
    try:
        out = subprocess.check_output(
            ["ip", "route", "get", "8.8.8.8"], stderr=subprocess.DEVNULL
        ).decode()
        for token, nxt in zip(out.split(), out.split()[1:]):
            if token == "dev":
                return nxt
    except Exception:
        pass
    return None


def read_bytes(iface):
    with open("/proc/net/dev") as f:
        for line in f:
            if line.strip().startswith(iface + ":"):
                fields = line.split(":")[1].split()
                rx_bytes = int(fields[0])
                tx_bytes = int(fields[8])
                return rx_bytes, tx_bytes
    return None, None


def format_speed(bytes_per_sec):
    kb = bytes_per_sec / 1024
    if kb >= 1024:
        return f"{kb / 1024:.1f} MB/s"
    return f"{kb:.1f} KB/s"


def main():
    iface = get_default_iface()
    if not iface:
        print(json.dumps({"text": "disconnected"}))
        return

    rx, tx = read_bytes(iface)
    now = time.time()

    if rx is None:
        print(json.dumps({"text": "disconnected"}))
        return

    down_speed = up_speed = 0.0
    if os.path.exists(STATE_FILE):
        try:
            with open(STATE_FILE) as f:
                prev = json.load(f)
            dt = now - prev["time"]
            if dt > 0:
                down_speed = (rx - prev["rx"]) / dt
                up_speed = (tx - prev["tx"]) / dt
        except Exception:
            pass

    with open(STATE_FILE, "w") as f:
        json.dump({"rx": rx, "tx": tx, "time": now}, f)

    down_text = format_speed(max(down_speed, 0))
    up_text = format_speed(max(up_speed, 0))
    text = (
        f' <span font_weight="600">{down_text}</span>'
        f'   <span font_weight="500">{up_text}</span>'
    )
    print(json.dumps({"text": text, "tooltip": iface}))


if __name__ == "__main__":
    main()
