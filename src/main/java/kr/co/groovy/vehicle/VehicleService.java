package kr.co.groovy.vehicle;

import kr.co.groovy.enums.Hipass;
import kr.co.groovy.vo.VehicleVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class VehicleService {
    private final VehicleMapper mapper;

    public List<VehicleVO> getVehicles() {
        List<VehicleVO> vehicles = mapper.getVehicles();
        for (VehicleVO vehicle : vehicles) {
            vehicle.setCommonCodeHipassAsnAt(Hipass.valueOf(vehicle.getCommonCodeHipassAsnAt()).label());
        }
        return vehicles;
    }
}
