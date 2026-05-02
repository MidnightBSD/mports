PORTNAME=	eza
DISTVERSIONPREFIX=	v
DISTVERSION=	0.23.4
PORTREVISION=	2
CATEGORIES=	sysutils
MASTER_SITES=	https://github.com/eza-community/${PORTNAME}/releases/download/v${DISTVERSION}/man-${DISTVERSION}.tar.gz?dummy=/:man
DISTFILES=	${PORTNAME}-man-${DISTVERSION}.tar.gz:man

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modern, maintained replacement for ls
WWW=		https://eza.rocks/

LICENSE=	EUPL12
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		cargo

USE_GITHUB=	yes
GH_ACCOUNT=	eza-community

PLIST_FILES=	bin/${PORTNAME} \
		etc/bash_completion.d/${PORTNAME}.bash \
		share/fish/completions/${PORTNAME}.fish \
		share/man/man1/eza.1.gz \
		share/man/man5/eza_colors-explanation.5.gz \
		share/man/man5/eza_colors.5.gz \
		share/zsh/site-functions/_${PORTNAME}

post-install:
	@${MKDIR} ${PREFIX}/etc/bash_completion.d
	${INSTALL_DATA} ${WRKSRC}/completions/bash/${PORTNAME} ${PREFIX}/etc/bash_completion.d/${PORTNAME}.bash
	@${MKDIR} ${PREFIX}/share/fish/completions
	${INSTALL_DATA} ${WRKSRC}/completions/fish/${PORTNAME}.fish ${PREFIX}/share/fish/completions/${PORTNAME}.fish
	@${MKDIR} ${PREFIX}/share/zsh/site-functions
	${INSTALL_DATA} ${WRKSRC}/completions/zsh/_${PORTNAME} ${PREFIX}/share/zsh/site-functions/_${PORTNAME}
	${INSTALL_MAN} ${WRKDIR}/target/man-${DISTVERSION}/*.1 ${PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKDIR}/target/man-${DISTVERSION}/*.5 ${PREFIX}/share/man/man5

.include <bsd.port.mk>
