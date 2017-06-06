package com.ja0ck5.springcloud.data.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ja0ck5.springcloud.data.model.Channel;


@Repository
public class ChannelDao extends BaseHomeDao {



	public List<Channel> getAll() {
		String sql = "select * from channel";
		return getJdbcTemplate().query(sql, rowMapper);
	}

	public Channel getById(long id) {
		String sql = "select * from channel where id = " + id;
		return getJdbcTemplate().queryForObject(sql, rowMapper);
	}

	public List<Long> getAllIds() {
		String sql = "select id from channel order by score desc";
		return getJdbcTemplate().queryForList(sql, Long.class);
	}

	public List<Long> getAllTagIds() {
		String sql = "select tagId from channel order by score desc";
		return getJdbcTemplate().queryForList(sql, Long.class);
	}

	protected RowMapper<Channel> rowMapper = new RowMapper<Channel>() {

		@Override
		public Channel mapRow(ResultSet rs, int rowNum) throws SQLException {
			Channel model = new Channel();
			model.setId(rs.getLong("id"));
			model.setChannelMark(rs.getString("channelMark"));
			model.setTagId(rs.getLong("tagId"));
			model.setIsRec(rs.getInt("isRec"));
			model.setIsGame(rs.getInt("isGame"));
			model.setScore(rs.getInt("score"));
			model.setCreateTime(rs.getTimestamp("createTime"));
			return model;
		}

	};

}
