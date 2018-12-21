package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.modules.sys.entity.CmsUserEntity ;
import org.springframework.stereotype.Repository;


public interface CmsUserDAO  extends BaseMapper<CmsUserEntity> {

    int deleteByPrimaryKey(Long id);

    int doInsert(CmsUserEntity record);

    int insertSelective(CmsUserEntity record);

    CmsUserEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(CmsUserEntity record);

    int updateByPrimaryKey(CmsUserEntity record);

}