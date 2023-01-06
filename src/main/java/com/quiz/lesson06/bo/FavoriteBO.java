package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.FavoriteDAO;
import com.quiz.lesson06.model.Favorite;

@Service
public class FavoriteBO {
	
	@Autowired
	private FavoriteDAO favoriteDAO;

	public void addFavorite(String name, String url) {
		favoriteDAO.insertFavorite(name, url);
	}
	
	public List<Favorite> getFavoriteList() {
		return favoriteDAO.selectFavoriteList();
	}
	
	public boolean existFavoriteByUrl(String url) {
		return favoriteDAO.existFavoriteByUrl(url);
	}
	
	public Favorite getFavoriteByUrl(String url) {
		//return favoriteDAO.selectFavoriteByUrl(url);
		
		// BO에서 가공해서 Controller가 필요한 정보를 주기위한 가공을 함(가공할 때 브레이크 포인트로 디버깅할 때 확인할 수 있음)
		List<Favorite> favoriteList = favoriteDAO.selectFavoriteByUrl(url); // 여기 브레이크 포인트
		// 0 1  중복되는 행 중에 0번째걸 주겠다. (없으면 null이 아니고 [비어있는 리스트]임)
		if (favoriteList.isEmpty() == false) { // 리스트가 비어있지 않을 때(채워져 있을 때)
			return favoriteList.get(0);
		}
		
		// 비어있는 경우
		return null;
	}
	
	public int deleteFavoriteById(int id) {
		return favoriteDAO.deleteFavoriteById(id);
	}
}
