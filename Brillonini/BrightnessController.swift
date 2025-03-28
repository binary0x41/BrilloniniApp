//
//  BrightnessController.swift
//  Brillonini
//
//  Created by brus on 28/3/25.
//




import SwiftUI
import IOKit.pwr_mgt

class BrightnessController {
    static func setBrightness(_ value: Double) {
        let brightness = Float(value)

        var iterator: io_iterator_t = 0
        let result = IOServiceGetMatchingServices(kIOMasterPortDefault, IOServiceMatching("IODisplayConnect"), &iterator)

        if result == kIOReturnSuccess {
            var service: io_object_t = 0
            while true {
                service = IOIteratorNext(iterator)
                if service == 0 {
                    break
                }
                IODisplaySetFloatParameter(service, 0, kIODisplayBrightnessKey as CFString, brightness)
                IOObjectRelease(service)
            }
            IOObjectRelease(iterator)
        } else {
            print("Error: No se encontraron servicios de pantalla.")
        }
    }

    static func getBrightness() -> Double {
        var brightness: Float = 0.5 // Valor predeterminado

        var iterator: io_iterator_t = 0
        let result = IOServiceGetMatchingServices(kIOMasterPortDefault, IOServiceMatching("IODisplayConnect"), &iterator)

        if result == kIOReturnSuccess {
            var service: io_object_t = 0
            service = IOIteratorNext(iterator)
            if service != 0 {
                if IODisplayGetFloatParameter(service, 0, kIODisplayBrightnessKey as CFString, &brightness) != kIOReturnSuccess {
                    print("Error: No se pudo obtener el brillo.")
                }
                IOObjectRelease(service)
            }
            IOObjectRelease(iterator)
        } else {
            print("Error: No se encontraron servicios de pantalla.")
        }
        return Double(brightness)
    }
}
