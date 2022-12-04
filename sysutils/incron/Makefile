PORTNAME=	incron
DISTVERSION=	2017-11-13
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Handle filesystem-events the way cron handles time ones
WWW=		https://inotify.aiken.cz/?section=incron&page=about

LICENSE=	gpl2 lgpl2.1 mit
LICENSE_COMB=	dual
LICENSE_FILE_gpl2=	${WRKSRC}/LICENSE-GPL
LICENSE_FILE_lgpl2.1=	${WRKSRC}/LICENSE-LGPL
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-X11

LIB_DEPENDS=	libinotify.so:devel/libinotify

USES=		compiler
USE_GITHUB=	yes
GH_ACCOUNT=	ar-
GH_TAGNAME=	81421d3a8bde0989d7e167d8a814d5232896c930
CPPFLAGS+=	-I${LOCALBASE}/include -D__NR_inotify_init
LDFLAGS+=	-L${LOCALBASE}/lib -linotify
MAKE_ARGS=	PREFIX="${PREFIX}" USER=${UID}	\
		DOCDIR="${PREFIX}/etc"	\
		MANPATH=${MANPREFIX}/man
USE_RC_SUBR=	${PORTNAME}

.include <bsd.port.pre.mk>

post-patch:
	${REINPLACE_CMD} -e 's,/etc/incron,${PREFIX}/etc/incron,'	\
		${WRKSRC}/*conf* ${WRKSRC}/Makefile ${WRKSRC}/*.[158h]	\
		${WRKSRC}/*.cpp
	${REINPLACE_CMD} -e '/INITDIR/d' ${WRKSRC}/Makefile
.if ${CHOSEN_COMPILER_TYPE} == gcc && ${COMPILER_VERSION} <= 42
	${REINPLACE_CMD} -e '/pragma/d' ${WRKSRC}/inotify-cxx.cpp \
		${WRKSRC}/usertable.cpp
.endif

.include <bsd.port.post.mk>
