# $MidnightBSD: mports/sysutils/nvclock/Makefile,v 1.2 2010/01/02 22:40:51 laffer1 Exp $
# $FreeBSD: ports/sysutils/nvclock/Makefile,v 1.12 2007/07/15 07:15:42 rafan Exp $

PORTNAME=	nvclock
DISTVERSION=	0.8b4
CATEGORIES=	sysutils
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/0.8%20%28beta4%29
DISTNAME=	nvclock${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The nVidia graphic card status and overclocking tool
LICENSE=	gpl2

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_PKGCONFIG=	yes

CONFIGURE_ARGS+=	--build=${ARCH}-portbld-freebsd6.0 \
			--host=${ARCH}-portbld-freebsd6.0 \
			--prefix=${PREFIX}

.if defined(WITHOUT_GUI)
PLIST_SUB+=	GTK="@comment "
CONFIGURE_ARGS+="--enable-gtk=no"
.else
USE_GNOME+=	gtk20
PLIST_SUB+=	GTK=""
.endif

MAN1=		nvclock.1

PORTDOCS=	ABOUT AUTHORS ChangeLog FAQ README

pre-everything::
	@${ECHO_MSG} ""
	@${ECHO_MSG} "************************************************"
	@${ECHO_MSG} "* You can disable nvclock's GTK user interface *"
	@${ECHO_MSG} "* by defining WITHOUT_GUI.                     *"
	@${ECHO_MSG} "************************************************"
	@${ECHO_MSG} ""

post-patch:
.for i in src/gtk/Makefile.in src/backend/Makefile.in
	@${REINPLACE_CMD} -e 's|"CFLAGS="|"CFLAGS+="|g' ${WRKSRC}/${i}
.endfor

do-install:
	@${GMAKE} -C ${WRKSRC}/src install
	@${GMAKE} -C ${WRKSRC} install-man
.if !defined(WITHOUT_GUI)
	@${GMAKE} -C ${WRKSRC}/src/gtk install
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${GMAKE} -C ${WRKSRC} install-docs
.endif

.include <bsd.port.mk>
