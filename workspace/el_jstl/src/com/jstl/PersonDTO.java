package com.jstl;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@NoArgsConstructor
@Data
@AllArgsConstructor
public class PersonDTO {
	@NonNull
	private String name;
	private int age;
}
