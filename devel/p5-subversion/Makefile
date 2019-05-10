# Created by: Autrijus Tang <autrijus@autrijus.org>
# $FreeBSD: head/devel/p5-subversion/Makefile 483685 2018-11-01 16:12:44Z lev $

PKGNAMEPREFIX=	p5-

MAINTAINER=	lev@FreeBSD.org
COMMENT=	Perl bindings for Version control system

USES=		perl5
USE_PERL5=	build run

PORTREVISION_111=	0
PORTREVISION_19=	0

SVN_BUILD_BINDINGS=	yes

.include "${.CURDIR}/../../devel/subversion/Makefile.addons"

CATEGORIES+=	perl5

CONFIGURE_ARGS+=	--without-gnome-keyring \
			--without-kwallet \
			--with-apxs=no

ALL_TARGET=	swig-pl-lib swig-pl
INSTALL_TARGET=	install-swig-pl

pre-install:
	${REINPLACE_CMD} '/SWIG_PL_DIR/s, install$$, all pure_install,g' ${WRKSRC}/Makefile

.include <bsd.port.post.mk>
