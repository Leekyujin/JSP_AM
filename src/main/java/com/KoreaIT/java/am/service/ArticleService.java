package com.KoreaIT.java.am.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.KoreaIT.java.am.dao.ArticleDao;
import com.KoreaIT.java.am.util.SecSql;

public class ArticleService {
	private Connection conn;
	private ArticleDao articleDao;
	
	public ArticleService(Connection conn) {
		this.articleDao = new ArticleDao(conn);
	}
	
	public int getItemsInAPage() {
		return 10;
	}

	public int getForPrintListTotalPage() {
		
		int itemsInAPage = getItemsInAPage();
		
		int totalCount = articleDao.getTotalCount();
		int totalPage = (int) Math.ceil((double) totalCount / itemsInAPage);
		
		return totalPage;
	}

	public List<Map<String, Object>> getForPrintArticleRows(int page) {
		
		int itemsInAPage = getItemsInAPage();
		
		int limitFrom = (page - 1) * itemsInAPage;
		
		SecSql sql = SecSql.from("SELECT A.*, M.name AS writer");
		sql.append("FROM article AS A");
		sql.append("INNER JOIN `member` AS M");
		sql.append("ON A.memberId = M.id");
		sql.append("ORDER BY A.id DESC");
		sql.append("LIMIT ?, ?", limitFrom, itemsInAPage);

		List<Map<String, Object>> articleRows = articleDao.getArticleRows(itemsInAPage, limitFrom);

		return articleRows;
	}
}
