PORTNAME=	lame
DISTVERSION=	3.100
PORTREVISION=	4
CATEGORIES=	audio
MASTER_SITES=	SF/${PORTNAME:tl}/${PORTNAME:tl}/${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast MP3 encoder kit
WWW=		http://lame.sourceforge.net/

LICENSE=	lgpl+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${BUILD_DEPENDS_${ARCH}}
BUILD_DEPENDS_i386=	nasm:devel/nasm

USES=		cpe gmake iconv libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share

CONFIGURE_ARGS=	--enable-nasm --enable-mp3rtp --disable-gtktest
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4
CPE_VENDOR=	lame_project

DOC_FILES=	API LICENSE README TODO USAGE

OPTIONS_DEFINE=	DOCS
OPTIONS_DEFAULT=DOCS

post-patch:
# Fix parallel builds
	@${REINPLACE_CMD} -e 's,test -d \.libs || mkdir,mkdir -p,' \
		${WRKSRC}/libmp3lame/i386/Makefile.in
# Remove undefined symbol from linker version script - XXX to be removed with lame 3.101
	@${REINPLACE_CMD} -e '/lame_init_old/d' ${WRKSRC}/include/libmp3lame.sym

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libmp3lame.so.0

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for file in ${DOC_FILES}
	${INSTALL_DATA} ${WRKSRC}/${file} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
