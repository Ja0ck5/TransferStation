package com.ja0ck5.springcloud.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ja0ck5.springcloud.data.dao.ChannelDao;
import com.ja0ck5.springcloud.data.model.Channel;

@RestController
public class ChannelController {

	@Autowired
	ChannelDao channelDao;

	@GetMapping("/api/all")
	public List<Channel> getAll() {
		List<Channel> all = channelDao.getAll();
		return all;
	}

	@GetMapping("/api/channel/{id}")
	public Channel getBook(@PathVariable("id") long id) {
		Channel channel = channelDao.getById(id);
		return channel;
	}

}
