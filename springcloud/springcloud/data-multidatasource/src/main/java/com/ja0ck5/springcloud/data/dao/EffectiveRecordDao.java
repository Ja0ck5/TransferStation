package com.ja0ck5.springcloud.data.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ja0ck5.springcloud.data.model.EffectiveRecord;

@Repository
public class EffectiveRecordDao extends BaseDataDao {

	public EffectiveRecord getById(long id) {
		String sql = "select * from effectiveRecord where id = " + id;
		return getJdbcTemplate().queryForObject(sql, rowMapper);
	}

	protected RowMapper<EffectiveRecord> rowMapper = new RowMapper<EffectiveRecord>() {

		@Override
		public EffectiveRecord mapRow(ResultSet rs, int rowNum) throws SQLException {
			EffectiveRecord model = new EffectiveRecord();
			model.setId(rs.getLong("id"));
			model.setArticleId(rs.getLong("articleId"));
			model.setChannelId(rs.getLong("channelId"));
			model.setCreateTime(rs.getTimestamp("createTime"));
			return model;
		}
	};

}
