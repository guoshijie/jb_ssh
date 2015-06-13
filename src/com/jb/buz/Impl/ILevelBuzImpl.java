package com.jb.buz.Impl;

import com.jb.buz.ILevelBuz;
import com.jb.dao.ILevelDao;
import com.jb.pojo.Level;

public class ILevelBuzImpl implements ILevelBuz {
	
	private ILevelDao iLevelDao;
	
	public Level getLevel(int id){
		return iLevelDao.getLevel(id);
	}

	public void setiLevelDao(ILevelDao iLevelDao) {
		this.iLevelDao = iLevelDao;
	}
	
}
