package kr.co.groovy.vehicle;

import kr.co.groovy.vo.VehicleVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Mapper
public interface VehicleMapper {
    public List<VehicleVO> getVehicles();


}
