# $MidnightBSD$
# $FreeBSD: ports/x11/xfce4-conf/Makefile,v 1.11 2010/05/31 15:34:46 oliver Exp $

PORTNAME=	xfce4-conf
PORTVERSION=	4.12.0
CATEGORIES=	x11 xfce
MASTER_SITES=	XFCE
DISTNAME=	xfconf-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	D-Bus-based configuration storage system

LICENSE=	gpl2

BUILD_DEPENDS=	p5-XML-Parser>=2.41:${PORTSDIR}/textproc/p5-XML-Parser
LIB_DEPENDS=	libdbus-glib-1.so:${PORTSDIR}/devel/dbus-glib

GNU_CONFIGURE=	yes
USE_GNOME=	glib20 gtk20 intltool intlhack
USE_LDCONFIG=	yes
USE_PERL5=	build
USE_XFCE=	libutil
USE_XORG=	x11
USES=		gmake libtool pathfix pkgconfig perl5 gettext-tools \
	xfce tar:bzip2

CONFIGURE_ARGS=--without-html-dir

OPTIONS_DEFINE=		PERL NLS
NLS_USES=	gettext-runtime
NLS_CONFIGURE_ENABLE=	nls
PERL_BUILD_DEPENDS=	p5-ExtUtils-Depends>=0.304:${PORTSDIR}/devel/p5-ExtUtils-Depends \
	p5-ExtUtils-PkgConfig>=1.15:${PORTSDIR}/devel/p5-ExtUtils-PkgConfig \
	p5-Glib2>=1.280:${PORTSDIR}/devel/p5-Glib2
PERL_USE=	perl5=run
PERL_CONFIGURE_ENABLE=	perl-bindings
OPTIONS_SUB=	yes

.include <bsd.port.mk>
