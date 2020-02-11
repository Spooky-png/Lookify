package com.spooky.lookify.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spooky.lookify.models.Song;
import com.spooky.lookify.services.SongService;

@RestController
public class SongsApi {
	private final SongService songService;
	public SongsApi(SongService songService) {
		this.songService = songService;
	}
	@RequestMapping("/api/songs")
	public List<Song> index(){
		return songService.allSongs();
	}
	
	@RequestMapping(value="/api/songs", method=RequestMethod.POST)
	public Song create(@RequestParam(value="title") String title, @RequestParam(value="artist") String artist, @RequestParam(value="rating") Integer rating) {
		Song song = new Song(title, artist, rating);
		return songService.createSong(song);
	}
	@RequestMapping(value="/api/songs/{id}", method=RequestMethod.DELETE)
	public void destory(@PathVariable("id") Long id) {
		songService.deleteSong(id);
	}
}
