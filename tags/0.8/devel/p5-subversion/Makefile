# $MidnightBSD$

PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl bindings for Version control system

LICENSE=	other

MASTERDIR=	${.CURDIR}/../../devel/subversion
PKGDIR=		${.CURDIR}

USE_PERL5=	yes

SVN_BUILD_BINDINGS=	yes
SVN_BUILD_ADDONS=	yes

.include "${MASTERDIR}/Makefile.common"

.include <bsd.mport.options.mk>

CATEGORIES+=	perl5

CONFIGURE_ARGS+=	--without-gnome-keyring \
			--without-kwallet \
			--with-apxs=no

ALL_TARGET=	swig-pl-lib swig-pl
INSTALL_TARGET=	install-swig-pl

pre-install:
	${REINPLACE_CMD} '/SWIG_PL_DIR/s, install$$, all pure_install,g' ${WRKSRC}/Makefile

.include <bsd.port.post.mk>
