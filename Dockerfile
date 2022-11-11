FROM fatal_backend_base 
RUN apt-get update -qq
RUN mkdir /home/fatal
ADD ./ /home/fatal
WORKDIR /home/fatal

RUN pwd
RUN ls -la


RUN bundle install
RUN rails db:prepare --trace
ENTRYPOINT ["sh","/data/start.sh"]
EXPOSE 3000
