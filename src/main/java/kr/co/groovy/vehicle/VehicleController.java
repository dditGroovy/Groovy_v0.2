package kr.co.groovy.vehicle;

import kr.co.groovy.vo.VehicleVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/facility/vehicle")
@RequiredArgsConstructor
public class VehicleController {
    private final VehicleService service;

    @GetMapping("/")
    public ModelAndView getVehicles(ModelAndView mav) {
        List<VehicleVO> vehicles = service.getVehicles();
        mav.addObject("vehicles", vehicles);
        mav.setViewName("facility/carResve");
        return mav;
    }
}
