package com.spooky.lookify.controllers;

import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spooky.lookify.models.Song;
import com.spooky.lookify.repositories.SongRepository;
import com.spooky.lookify.services.SongService;

@Controller
public class SongController {
	private final SongService songService;
	private final SongRepository songRepository;

	public SongController(SongService songService, SongRepository songRepository) {
		this.songRepository = songRepository;
		this.songService = songService;
	}
	@RequestMapping("/")
	public String index() {
		return "/songs/index.jsp";
	}
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		List<Song> songs = songService.allSongs();
		model.addAttribute("songs", songs);
		return "/songs/dashboard.jsp";
	}
	@RequestMapping("/search{q}")
	public String search(@RequestParam(value="q") String searchQuery, Model model) {
		List<Song> searchsong = songRepository.findByArtistContaining(searchQuery);
		model.addAttribute("songs", searchsong);
		return "/songs/search.jsp";
	}
	@RequestMapping("/songs/topTen")
	public String topTen(Model model) {
		List<Song> sortedsongs = songRepository.findTop10ByOrderByRatingDesc();
		model.addAttribute("songs", sortedsongs);
		return "/songs/topTen.jsp";
	}
	@RequestMapping("/songs/new")
	public String newSongs(@ModelAttribute("song") Song song) {
		return "/songs/new.jsp";
	}
	@RequestMapping(value="/songs/new", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("song") Song song, BindingResult result) {
		if(result.hasErrors()) {
			return "/songs/new.jsp";
		}
		else {
			songService.createSong(song);
			return "redirect:/dashboard";
		}
	}
		@RequestMapping("/songs/{id}")
		public String show(@PathVariable("id") Long id, Model model) {
			Song song = songService.findSong(id);
			model.addAttribute("song", song);
			return "/songs/show.jsp";
		}
		@RequestMapping(value="/delete/{id}")
		public String destroy(@PathVariable("id") Long id) {
			songService.deleteSong(id);
			return "redirect:/dashboard";
		}
	}