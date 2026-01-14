MASTERDIR=	${.CURDIR:H}/libcanberra
SLAVEPORT=	gtk2
CANBERRA=	gtk2

post-install:
	${MKDIR} ${FAKE_DESTDIR}/${TRUE_PREFIX}/include/canberra-gtk2
	${MV} ${FAKE_DESTDIR}/${TRUE_PREFIX}/include/canberra-gtk.h ${FAKE_DESTDIR}/${TRUE_PREFIX}/include/canberra-gtk2

.include "${MASTERDIR}/Makefile"
