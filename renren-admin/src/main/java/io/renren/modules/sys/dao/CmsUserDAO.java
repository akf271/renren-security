package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.modules.sys.entity.CmsUserEntity ;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface CmsUserDAO  extends BaseMapper<CmsUserEntity> {

    List<CmsUserEntity> getSystemAdminUsers(@Param("userIdList") List<Long> userIdList);

    int deleteByPrimaryKey(Long id);

    int doInsert(CmsUserEntity record);

    int insertSelective(CmsUserEntity record);

    CmsUserEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(CmsUserEntity record);

    int updateByPrimaryKey(CmsUserEntity record);

}