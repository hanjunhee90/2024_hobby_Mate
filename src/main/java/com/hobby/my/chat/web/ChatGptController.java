package com.hobby.my.chat.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hobby.my.chat.service.ChatGptService;

@Controller
public class ChatGptController {

    @Autowired
    private ChatGptService chatGptService;

    @RequestMapping(value = "/chat", method = RequestMethod.GET)
    public String chatForm() {
        return "chat/chatForm";  // 사용자 입력 폼 페이지
    }

    @RequestMapping(value = "/chat", method = RequestMethod.POST)
    public String getChatGptResponse(@RequestParam("prompt") String prompt, Model model) {
        String response = chatGptService.getChatGptResponse(prompt);
        
        model.addAttribute("response", response);
        return "chat/chatResult";  // ChatGPT 응답 페이지
    }
}
