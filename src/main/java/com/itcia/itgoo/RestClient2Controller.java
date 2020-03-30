package com.itcia.itgoo;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.itcia.itgoo.dto.Auction;
import com.itcia.itgoo.dto.Company;
import com.itcia.itgoo.dto.Reservation;
import com.itcia.itgoo.dto.SmallMeeting;
import com.itcia.itgoo.dto.Test;
import com.itcia.itgoo.service.AuctionManagement;
import com.itcia.itgoo.service.ClientManagement;
import com.itcia.itgoo.service.TestManagement;

@Controller
public class RestClient2Controller {
	ModelAndView mav = new ModelAndView();

	@Autowired
	private ClientManagement cm;

	@PostMapping(value = "/regismallmeeting")
	public  ModelAndView regismallmeeting (Principal p,SmallMeeting sm) {
		if(p!=null) {
			p.getName ();
			System.out.println("p="+p.getName());
		}
		mav= cm.regismallmeeting(p,sm);

		return mav;
	}
	@RequestMapping(value = "/smalllistdetail" , method = RequestMethod.GET)
	public ModelAndView smalllistdetail(Integer smallnumber) {	//null 값도 받으려고
		System.out.println("여기 있어요");

		mav= cm.smalllistdetail(smallnumber);

		return mav;
	}
	@RequestMapping(value = "/myenrollsmalldetail" , method = RequestMethod.GET)
	public ModelAndView myenrollsmalldetail(Integer smallnumber) {	//null 값도 받으려고
		System.out.println("여기 있어요");

		mav= cm.myenrollsmalldetail(smallnumber);

		return mav;
	}
}
