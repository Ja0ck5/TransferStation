package com.ja0ck5.springcloud.data.model;

/**
 * 频道
 * 
 * @author Jack
 *
 */
public class Channel extends BaseModel {

	/**
	 * 客户端渠道标识
	 */
	private String channelMark;

	/**
	 * @return the {@link #channelMark}
	 */
	public String getChannelMark() {
		return channelMark;
	}

	/**
	 * @param channelMark
	 *            the {@link #channelMark} to set
	 */
	public void setChannelMark(String channelMark) {
		this.channelMark = channelMark;
	}

	/**
	 * 标签Id
	 */
	private long tagId;
	/**
	 * 是否推荐,0否,1是
	 */
	private int isRec;
	/**
	 * 是否为游戏,0否,1是
	 */
	private int isGame;
	/**
	 * 分数大则靠前
	 */
	private int score;

	/**
	 * @return {@link #tagId}
	 */
	public long getTagId() {
		return tagId;
	}

	/**
	 * @param tagId
	 *            {@link #tagId}
	 */
	public void setTagId(long tagId) {
		this.tagId = tagId;
	}

	/**
	 * @return {@link #isRec}
	 */
	public int getIsRec() {
		return isRec;
	}

	/**
	 * @param tagId
	 *            {@link #isRec}
	 */
	public void setIsRec(int isRec) {
		this.isRec = isRec;
	}

	/**
	 * @return {@link #isGame}
	 */
	public int getIsGame() {
		return isGame;
	}

	/**
	 * @param tagId
	 *            {@link #isGame}
	 */
	public void setIsGame(int isGame) {
		this.isGame = isGame;
	}

	/**
	 * @return {@link #score}
	 */
	public int getScore() {
		return score;
	}

	/**
	 * @param tagId
	 *            {@link #score}
	 */
	public void setScore(int score) {
		this.score = score;
	}

}
