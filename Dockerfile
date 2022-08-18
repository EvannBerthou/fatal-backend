FROM fatal_backend_base 
RUN apt-get update -qq
RUN mkdir /home/fatal
ADD ./ /home/fatal
WORKDIR /home/fatal

RUN pwd
RUN ls -la


RUN bundle install
RUN rake db:migrate
ENTRYPOINT ["rails"]
CMD ["s","-b","0.0.0.0"]
EXPOSE 3000
