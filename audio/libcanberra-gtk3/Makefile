MASTERDIR=	${.CURDIR:H}/libcanberra
SLAVEPORT=	gtk3
CANBERRA=	gtk3

post-install:
	@${MKDIR} /${PREFIX}/include/canberra-gtk3
	@${MV} /${PREFIX}/include/canberra-gtk.h /${PREFIX}/include/canberra-gtk3

.include "${MASTERDIR}/Makefile"
