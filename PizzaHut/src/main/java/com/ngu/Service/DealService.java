package com.ngu.Service;

import java.util.List;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import com.ngu.Model.Deal;

public interface DealService {

	
	public Deal save(Deal deal);
	
	public List<Deal> ShowAllDeals();
	
	void deleteDeal(int id);

	public void saveMyDeal(Deal deal, MultipartFile dealsImage) throws Exception;
	
	public Resource findOneImage(String file);
}