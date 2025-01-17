package com.hobby.my.chat.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ChatGptService {

    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Value("#{util['openai.api.key']}")
    private String openaiApiKey;

    public ChatGptService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public String getChatGptResponse(String prompt) {
        // OpenAI API URL
    	String apiUrl = "https://api.openai.com/v1/completions";
        System.out.println("API Key: " + openaiApiKey);

        // HTTP 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + openaiApiKey);
        headers.set("Content-Type", "application/json");

        // 요청 본문 설정
        Map<String, Object> requestBody = new HashMap<>();
        requestBody.put("model", "text-davinci-003");  // 사용하려는 모델
        requestBody.put("prompt", prompt);             // 사용자 입력
        requestBody.put("max_tokens", 100);            // 최대 토큰 수

        // RestTemplate로 API 호출
        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);
        ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.POST, entity, String.class);

       

        try {
            // JSON 응답 파싱
            JsonNode root = objectMapper.readTree(response.getBody());
            return root.path("choices").get(0).path("text").asText().trim();
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred while parsing the response.";
        }
    }
}
