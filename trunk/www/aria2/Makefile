# $MidnightBSD: mports/www/aria2/Makefile,v 1.7 2009/12/31 18:44:56 laffer1 Exp $

PORTNAME=	aria2
DISTVERSION=	1.7.2
CATEGORIES=	www
MASTER_SITES=	SF/${PORTNAME}/stable/archives/${PORTNAME}-${PORTVERSION}
DISTNAME=	${PORTNAME}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet another download tool
LICENSE=	gpl2

CONFIGURE_ARGS=	--with-libintl-prefix=${LOCALBASE} --with-openssl \
		--with-libxml2 --without-gnutls --without-libares \
		--without-libcares --program-transform-name=""

USE_BZIP2=	yes
USE_GNOME=	gnomehack libxml2
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes
.ifdef WITHOUT_NLS
CONFIGURE_ARGS+=	--disable-nls
.else
LINGUAS=	bg ca da de es en@boldquot en@quot el fi fr he hu id it ja nl nn pl pt_BR ru sv \
		sk sr th tr uk vi zh_CN zh_TW
.endif
PLIST_FILES=	bin/aria2c \
		${LINGUAS:S|^|share/locale/|:S|$|/LC_MESSAGES/aria2.mo|}
MAN1=		aria2c.1

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 3000
BROKEN=		Does not compile on MidnightBSD 0.2
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^install-data-am:/s|install-dist_docDATA||'\
		${WRKSRC}/Makefile.in ${WRKSRC}/doc/Makefile.in

post-configure:
	@${REINPLACE_CMD} -e '/SETMODE/d' ${WRKSRC}/config.h

.include <bsd.port.post.mk>
