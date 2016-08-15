# $MidnightBSD$

PORTREVISION=	1
PKGNAMESUFFIX=	-qt4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast and lightweight QT4 BitTorrent client

LICENSE=	gpl2

LIB_DEPENDS=	${GEN_LIB_DEPENDS}
RUN_DEPENDS=	${GEN_RUN_DEPENDS}

DESCR=		${.CURDIR}/pkg-descr
MASTERDIR=	${.CURDIR}/../transmission-cli
PLIST=		${.CURDIR}/pkg-plist
SLAVEPORT=	qt4

QT_NONSTANDARD=	yes
USE_QT4=	moc_build qmake_build rcc_build uic_build gui dbus network
USES=		desktop-file-utils

EXTRA_CONF_ARGS=--disable-cli \
		--disable-daemon \
		--without-gtk \
		--disable-mac \
		--disable-nls

post-patch: general-patch
	@${REINPLACE_CMD} -e 's|/share/man|/man|g ; /PKGCONFIG/s| openssl||g' \
		${WRKSRC}/qt/qtr.pro
	@${ECHO_CMD} 'LIBS += -lcrypto' >> ${WRKSRC}/qt/qtr.pro

post-build:
	@(cd ${WRKSRC}/qt && ${QMAKE} ${QMAKE_ARGS} qtr.pro && ${MAKE_CMD})

do-install:
	@(cd ${WRKSRC}/qt && \
		${SETENV} INSTALL_ROOT=${PREFIX} ${MAKE_CMD} install)

post-install: general-install
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/qt/README.txt \
		${DOCSDIR}/README-qt4
	@${INSTALL_DATA} ${WRKSRC}/qt/transmission-qt.desktop \
		${PREFIX}/share/applications/
	@${INSTALL_DATA} ${WRKSRC}/qt/icons/transmission.png \
		${PREFIX}/share/pixmaps/transmission-qt.png

.include "${MASTERDIR}/Makefile"
