FROM fatal_backend_base 
RUN apt-get update -qq
RUN mkdir /home/fatal
ADD ./ /home/fatal
WORKDIR /home/fatal

RUN pwd
RUN ls -la


RUN bundle install
RUN rails db:prepare
ENTRYPOINT ["rails"]
CMD ["s","-e","production","-b","0.0.0.0","&&","export","SECRET_KEY_BASE=$(cat /data/secret)"]
EXPOSE 3000
