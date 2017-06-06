package com.ja0ck5.springcloud.data.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;

public class BaseDataDao {
	@Autowired
	@Qualifier("dataJdbcTemplate")
	private JdbcTemplate dataJdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return dataJdbcTemplate;
	}
}