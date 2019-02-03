# $MidnightBSD$

PORTNAME=	rclint
PORTVERSION=	0.2.1
CATEGORIES=	devel textproc python
MASTER_SITES=	http://www.bayofrum.net/dist/rclint/	\
		FREEBSD_LOCAL/crees/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Checks rc scripts for style and common errors

LICENSE=	bsd2

NO_BUILD=	yes

USES=		python:run
SUB_FILES=	${PORTNAME}
SUB_LIST=	PYTHON_CMD=${PYTHON_CMD}

PLIST_FILES=	bin/${PORTNAME}
PORTDATA=	${PORTNAME}.py errors.en

post-patch:
	${REINPLACE_CMD} -e "s,\(DATADIR = \)'\.',\1'${DATADIR}'," \
		${WRKSRC}/${PORTNAME}.py

do-install:
	${MKDIR} ${FAKE_DESTDIR}${DATADIR}
.for f in ${PORTDATA}
	${INSTALL_SCRIPT} ${WRKSRC}/$f ${FAKE_DESTDIR}${DATADIR}
.endfor
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
