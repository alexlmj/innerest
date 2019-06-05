package com.innerest.file;

public interface FileDao {
	void insertFile(FileVO file);
	FileVO selectFile(int parseInt);

}
