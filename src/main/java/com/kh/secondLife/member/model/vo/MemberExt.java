package com.kh.secondLife.member.model.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class MemberExt extends Member {
	private ProfileImg profileImg;
}
