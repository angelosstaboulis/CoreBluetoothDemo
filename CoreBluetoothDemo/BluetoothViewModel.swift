//
//  BluetoothViewModel.swift
//  CoreBluetoothDemo
//
//  Created by Angelos Staboulis on 1/2/24.
//

import Foundation
import CoreBluetooth
class BluetoothViewModel:NSObject,ObservableObject, CBCentralManagerDelegate{
    
    @objc func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            manager?.scanForPeripherals(withServices: nil)
        }
    }
    
    var manager:CBCentralManager?
    var peripherals:[CBPeripheral] = []
    @Published var deviceNames:[String] = []
    override init() {
        super.init()
        self.manager = CBCentralManager(delegate: self, queue: .main)
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if !peripherals.contains(peripheral){
            peripherals.append(peripheral)
            deviceNames.append(peripheral.name ?? "Device Unknown")
        }
    }
}
