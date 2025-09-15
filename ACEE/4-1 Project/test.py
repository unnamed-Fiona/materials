import serial #type:ignore
import time

sender_port = "COM4"  # 虚拟串口的另一端
baudrate = 115200

with serial.Serial(sender_port, baudrate) as ser:
    count = 0
    while True:
        data = f"ST,{count},TEMP,25.5,HUM,60%"
        ser.write(data.encode() + b'\n')  # 发送带换行符的字符串
        print(f"Sent: {data}")
        count += 1
        time.sleep(1)
