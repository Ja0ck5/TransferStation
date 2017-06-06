/**
 * 
 */
package com.ja0ck5.springcloud.data.model;


/**
 * 有效播放记录
 * 
 * @author Jack
 *
 */
public class EffectiveRecord extends BaseModel{

	protected long articleId;
	protected long channelId;

	/**
	 * @return the {@link #articleId}
	 */
	public long getArticleId() {
		return articleId;
	}

	/**
	 * @param articleId
	 *            the {@link #articleId} to set
	 */
	public void setArticleId(long articleId) {
		this.articleId = articleId;
	}

	/**
	 * @return the {@link #channelId}
	 */
	public long getChannelId() {
		return channelId;
	}

	/**
	 * @param channelId
	 *            the {@link #channelId} to set
	 */
	public void setChannelId(long channelId) {
		this.channelId = channelId;
	}

	public EffectiveRecord() {
	}

	public EffectiveRecord(long articleId, long channelId) {
		this.articleId = articleId;
		this.channelId = channelId;
	}

}
