# $MidnightBSD$

PORTNAME=	warden
PORTVERSION=	1.1.2
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	ftp://ftp.pcbsd.org/pub/software/ \
		http://www.pcbsd.org/~kris/software/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PC-BSD's Jail Management Utility

LICENSE=	bsd2

RUN_DEPENDS=	pbreg:${PORTSDIR}/sysutils/pbreg

WRKSRC=		${WRKDIR}/warden

USE_QT4=	corelib gui qmake_build moc_build rcc_build uic_build
HAS_CONFIGURE=	yes

DESTDIRNAME=	INSTALL_ROOT

QMAKE_PRO=	warden.pro
QMAKE_ARGS=	-unix -recursive ${QMAKE_PRO}

SUB_FILES=	pkg-message

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
				 ${WRKSRC}/warden.pro \
				 ${WRKSRC}/scripts/rc.d/wardenrc \
				 ${WRKSRC}/src/src.pro \
				 ${WRKSRC}/src/dialogwarden.h
	${RM} ${WRKSRC}/scripts/rc.d/wardenrc.bak

do-configure:
	@cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} \
		${QMAKE} -unix CONFIG+="configure" ${QMAKE_PRO}

.include <bsd.port.mk>
