package com.github.tarcv.doom_servers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;

@Configuration
@EnableWebSocket
public class AgentWebSocketConfig implements WebSocketConfigurer
{
    @Autowired
    protected MyWebSocketHandler webSocketHandler;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    	registry.addHandler(webSocketHandler, "/gs-guide-websocket")
    		.setAllowedOrigins("*");

    	registry.addHandler(webSocketHandler, "/console")
        	.setAllowedOrigins("*")
        	.withSockJS();
    }


    @Bean
    public ServletServerContainerFactoryBean createWebSocketContainer() {
        ServletServerContainerFactoryBean container = new ServletServerContainerFactoryBean();
        container.setMaxTextMessageBufferSize(81920);
        container.setMaxBinaryMessageBufferSize(81920);
        return container;
    }
}