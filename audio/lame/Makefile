# $MidnightBSD$

PORTNAME=	lame
PORTVERSION=	3.99.5
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	SF/${PORTNAME:L}/${PORTNAME:L}/3.99

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast MP3 encoder kit

LICENSE=	lgpl_patent
LICENSE_NAME=	LGPL + Patent restrictions.
LICENSE_TEXT=	Lame is covered under the LGPL, but commercial use requires royalty payments
LICENSE_PERMS=	dist-mirror pkg-mirror

USES=		gmake iconv libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-nasm --enable-mp3rtp --disable-gtktest

RESTRICTED=	patent issues, see http://www.mp3licensing.com/

MAN1=		lame.1

DOC_FILES=	API LICENSE README TODO USAGE

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
BUILD_DEPENDS+=	nasm:${PORTSDIR}/devel/nasm
.endif

post-patch:
# Fix parallel builds
	@${REINPLACE_CMD} -e 's,test -d \.libs || mkdir,mkdir -p,' \
		${WRKSRC}/libmp3lame/i386/Makefile.in

.if defined(NOPORTDOCS)
do-install:
	@cd ${INSTALL_WRKSRC} && ${SETENV} ${MAKE_ENV} ${GMAKE} \
		${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} install-exec
	@cd ${INSTALL_WRKSRC}/include && ${SETENV} ${MAKE_ENV} ${GMAKE} \
		${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} install-data
	@cd ${INSTALL_WRKSRC}/doc/man && ${SETENV} ${MAKE_ENV} ${GMAKE} \
		${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} install-data
.else
post-install: install-doc

install-doc:
	@${MKDIR} ${DOCSDIR}
.for file in ${DOC_FILES}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
