package kr.co.groovy.chat;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface ChatMapper {

    int createNewRoomNo();

    int insertChatRoom(Map<String, Object> data);

    int insertChatMember(String emplId);

}
