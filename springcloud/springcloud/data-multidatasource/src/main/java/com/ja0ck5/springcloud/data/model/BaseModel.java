package com.ja0ck5.springcloud.data.model;

import java.util.Date;


/**
 * 
 * @author Lucifer
 *
 */
public class BaseModel implements IGetId {

	protected long id;

	/**
	 * 创建时间 DEFAULT CURRENT_TIMESTAMP
	 */
	protected Date createTime;

	@Override
	public long getModelId() {
		return id;
	}

	/**
	 * @return the {@link #createTime}
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * @param createTime
	 *            the {@link #createTime} to set
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * @return the {@link #id}
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the {@link #id} to set
	 */
	public void setId(long id) {
		this.id = id;
	}

}
