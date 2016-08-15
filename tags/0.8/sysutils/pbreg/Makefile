# $MidnightBSD$

PORTNAME=	pbreg
PORTVERSION=	1.0
CATEGORIES=	sysutils
MASTER_SITES=	ftp://ftp.pcbsd.org/pub/software/ \
		http://www.pcbsd.org/~kris/software/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PC-BSD registry editor

LICENSE=	unknown

WRKSRC=		${WRKDIR}/PBReg

USE_QT4=	corelib gui qmake_build moc_build rcc_build uic_build
HAS_CONFIGURE=	yes

QMAKE_ARGS=     -unix -recursive ${QMAKE_PRO}
QMAKE_PRO=      PBReg.pro

DESTDIRNAME=	INSTALL_ROOT

PLIST_FILES=	bin/pbreg

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
				${WRKSRC}/${QMAKE_PRO}

do-configure:
	@cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} \
		${QMAKE} -unix CONFIG+="configure" ${QMAKE_PRO}

.include <bsd.port.mk>
