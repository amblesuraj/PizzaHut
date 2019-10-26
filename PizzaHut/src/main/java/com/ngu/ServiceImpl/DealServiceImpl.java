package com.ngu.ServiceImpl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ngu.Model.Deal;
import com.ngu.Repositories.DealRepository;
import com.ngu.Service.DealService;
@Service("dealService")
@Transactional
public class DealServiceImpl implements DealService {

	 
	
	@Autowired
	DealRepository dealRepository;
	
	final String folder ="/DealImage/";
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@Override
	public Deal save(Deal deal) {
		
		return dealRepository.save(deal);
	}

	@Override
	public List<Deal> ShowAllDeals() {
	
		return dealRepository.findAll();
	}

	@Override
	public void deleteDeal(int id) {
		dealRepository.deleteById(id);
	}
	@Autowired
	HttpServletRequest request;

	@Override
	public void saveMyDeal(Deal deal, MultipartFile file) throws Exception {

	   Path absolutePath = Paths.get(".").toAbsolutePath();
       
	   String imagePath = absolutePath + "/src/main/resources/static/DealImage/";
	   
       byte[] bytes=file.getBytes();
       
       
       Path path = Paths.get( imagePath + file.getOriginalFilename());
       
       Files.write(path, bytes);
		 
		deal.setDealsImage(file.getOriginalFilename());
		dealRepository.save(deal);
	}

	@Override
	public Resource findOneImage(String file) {
		// TODO Auto-generated method stub
		return resourceLoader.getResource("file:" + folder + "/" +file);
	}

}
