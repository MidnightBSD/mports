PORTNAME=	Locale-libintl
PORTVERSION=	1.33
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	libintl-perl-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Internationalization library for Perl
WWW=		https://metacpan.org/release/libintl-perl

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		iconv:translit localbase perl5
USE_PERL5=	configure

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_EXTRA_PATCHES_OFF=	${FILESDIR}/extra-patch-Makefile.PL
NLS_USES=		gettext

pre-configure-NLS-on:
	${REINPLACE_CMD} -e 's|#DIR =>|DIR =>|g' ${WRKSRC}/Makefile.PL

post-install-NLS-on:
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Locale/gettext_xs/gettext_xs.so

.include <bsd.port.mk>
