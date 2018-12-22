/**
 * Copyright 2018 人人开源 http://www.renren.io
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */

package io.renren.modules.sys.service.impl;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.annotation.DataFilter;
import io.renren.common.utils.Constant;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.sys.dao.CmsUserDAO;
import io.renren.modules.sys.entity.CmsUserEntity;
import io.renren.modules.sys.entity.SysDeptEntity;
import io.renren.modules.sys.service.*;
import io.renren.modules.sys.shiro.ShiroUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;


/**
 * 系统用户
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年9月18日 上午9:46:09
 */
@Service("cmsUserService")
public class CmsUserServiceImpl extends ServiceImpl<CmsUserDAO, CmsUserEntity> implements CmsUserService {
    @Autowired
    private SysConfigService sysConfigService;
    @Autowired
    private SysUserRoleService sysUserRoleService;
    @Autowired
    private SysDeptService sysDeptService;

    @Override
    @DataFilter(subDept = true, user = false)
    public PageUtils queryPage(Map<String, Object> params) {
        String username = (String)params.get("username");

        List<String> orderByList = new ArrayList<>();
        orderByList.add("id");
        Page<CmsUserEntity> page = this.selectPage(
                new Query<CmsUserEntity>(params).getPage(),
                new EntityWrapper<CmsUserEntity>()
                        .like(StringUtils.isNotBlank(username),"login_name", username)
                        .addFilterIfNeed(params.get(Constant.SQL_FILTER) != null, (String)params.get(Constant.SQL_FILTER)).orderDesc(orderByList)
        );

        for(CmsUserEntity cmsUserEntity : page.getRecords()){
            SysDeptEntity sysDeptEntity = sysDeptService.selectById(cmsUserEntity.getDeptId());
            if (Objects.nonNull(sysDeptEntity)) {
                cmsUserEntity.setDeptName(sysDeptEntity.getName());
            }
        }

        return new PageUtils(page);
    }
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(CmsUserEntity user) {
        LocalDateTime now = LocalDateTime.now();
        user.setNickname(Constant.DEFAULT_NICK_NAME);
        user.setHeadPic(Constant.DEFAULT_HEAD_PIC);
        user.setCreateTime(now);
        user.setUpdateTime(now);
        user.setPassword(ShiroUtils.doMd5(user.getPassword()));
        this.insert(user);

        //保存用户与角色关系
        sysUserRoleService.saveOrUpdate(user.getId(), user.getRoleIdList());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(CmsUserEntity user) {

        if(StringUtils.isBlank(user.getPassword())){
            user.setPassword(null);
        }else{
            user.setPassword(ShiroUtils.doMd5(user.getPassword()));
        }
        this.updateById(user);

        //保存用户与角色关系
        sysUserRoleService.saveOrUpdate(user.getId(), user.getRoleIdList());
    }


    @Override
    public boolean updatePassword(Long userId, String password, String newPassword) {
                CmsUserEntity cmsUserEntity = new CmsUserEntity();
        cmsUserEntity.setPassword(newPassword);
        return this.update(cmsUserEntity,
                new EntityWrapper<CmsUserEntity>().eq("id", userId).eq("password", password));
    }

    @Override
    public List<CmsUserEntity> getSystemAdminUsers(List<Long> userIdList) {
        return baseMapper.getSystemAdminUsers(userIdList);
    }
}
