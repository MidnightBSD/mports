# $MidnightBSD: mports/audio/faad/Makefile,v 1.6 2010/02/27 16:04:00 laffer1 Exp $

PORTNAME=	faad2
PORTVERSION=	2.7
PORTEPOCH=	1
CATEGORIES=	audio
MASTER_SITES=	SF/faac/${PORTNAME}-src/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPEG-2 and MPEG-4 AAC audio decoder
LICENSE=	gpl2

USE_BZIP2=	yes
USE_DOS2UNIX=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes
USE_AUTOTOOLS=	aclocal autoheader automake autoconf libtool
ACLOCAL_ARGS=	-I . -I ${LOCALBASE}/share/aclocal
AUTOMAKE_ARGS=	--add-missing
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"
USE_LDCONFIG=	yes

MAN1=		faad.1

.include <bsd.port.pre.mk>

post-extract:
	@${LN} -sf faad.man ${WRKSRC}/frontend/faad.1

post-patch:
	@${REINPLACE_CMD} -e '/AC_CONFIG_FILES(plugins/d' \
		${WRKSRC}/configure.in
	@${REINPLACE_CMD} -e 's|faad.man|faad.1|g' \
		${WRKSRC}/frontend/Makefile.am
	@${REINPLACE_CMD} -e 's|^AM_CFLAGS|AM_CPPFLAGS|g ; \
		 s|-iquote |-I|g' ${WRKSRC}/libfaad/Makefile.am
	@${REINPLACE_CMD} -e 's|= -DUSE_|= -fPIC -DPIC -DUSE_|g' \
		${WRKSRC}/common/mp4ff/Makefile.am
	@${ECHO_CMD} "SUBDIRS = libfaad common frontend" > \
		${WRKSRC}/Makefile.am

pre-configure:
	@cd ${WRKSRC}; ${SETENV} ${AUTOTOOLS_ENV} ${LIBTOOLIZE} --automake

.include <bsd.port.post.mk>
