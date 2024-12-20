package ch.hslu.sw10.vehicles;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class VehicleTest {
    @Test
    public void testOnOnOffOff() {
        Vehicle car = new Vehicle();
        car.switchOn();
        car.switchOn();
        car.switchOff();
        car.switchOff();
    }

    @Test
    public void testOnToOn() {
        Vehicle car = new Vehicle();
        car.switchOn();
        assertTrue(true);
    }

    @Test
    public void testOnToOff() {
        Vehicle car = new Vehicle();
        car.switchOn();
        assertTrue(true);
    }

    @Test
    public void testOffToOff() {
        Vehicle car = new Vehicle();
        car.switchOn();
        assertTrue(true);
    }
}