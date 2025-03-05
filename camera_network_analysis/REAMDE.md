> **DISCLAIMER:**  
> - This script is provided **for educational purposes only** and to be used **strictly** on devices and networks that you **own** or have permission to analyze.  
> - Engaging in **Man-in-the-Middle** attacks, **ARP spoofing**, or **DNS spoofing** on networks or devices that you do not own can be **illegal** in many jurisdictions.  
> - Always check **local laws** and ensure compliance with **legal requirements** before using these techniques.  
> - **You** are fully responsible for any **misuse** of this material.

---

## Repository Structure

```
camera_network_analysis/
├── README.md
├── LICENSE
├── scripts
│   ├── camera_analysis.sh
│   ├── bettercap_mitm.sh
│   ├── network_scan.sh
│   └── wireshark_sniffer.sh
└── logs
    └── captured_packets.pcap
```

1. **README.md**: Provides an overview of the project, legal disclaimers, and instructions.
2. **LICENSE**: (Optional) Choose an open-source license if you wish to share publicly.
3. **scripts/**: Holds the Bash scripts. 
   - **camera_analysis.sh**: Main script that ties everything together.
   - **bettercap_mitm.sh**: Script for running Bettercap commands.
   - **network_scan.sh**: Script for running Nmap scans.
   - **wireshark_sniffer.sh**: Example script for running Wireshark or TShark.
4. **logs/**: Folder to store any captured packet dumps (`.pcap`) or text logs.

---

# How to Use

1. **Clone or Copy this Repository**  
   ```bash
   git clone https://github.com/napalm911/scripts.git
   cd camera_network_analysis
   ```
2. **Install Dependencies**  
   - **Nmap**: `sudo apt install nmap`
   - **Bettercap**: `sudo apt install bettercap`
   - **Wireshark/TShark**: `sudo apt install wireshark tshark`
3. **Make Scripts Executable**  
   ```bash
   chmod +x scripts/*.sh
   chmod +x camera_analysis.sh
   ```
4. **Run the Main Script**  
   ```bash
   sudo ./camera_analysis.sh
   ```
5. **Follow On-Screen Prompts**  
   - The script will ask for your camera IP.  
   - Choose whether to perform ARP spoofing or DNS spoofing.  
   - Capture packets with TShark.  
6. **Analyze Packets** in the `logs/` Folder  
   - Look for **HTTP** or **RTSP** credentials.  
   - If HTTPS is in use, you may need to install a custom certificate on the camera or device to view decrypted traffic (only if legally allowed in your locale).

---

# Final Disclaimer

This repository and its scripts are designed to be a **template** for **legitimate** network traffic inspection—specifically for owners who want to manage and integrate their IP cameras into systems like **Shinobi**. **Any misuse** of this material for unauthorized surveillance or attacks is **strictly prohibited** and may be **punishable by law**. Always consult legal counsel or refer to local laws before proceeding with network interception techniques. 

---

**Feel free to modify these scripts and the README to suit your specific environment and any other tools you prefer to use.**